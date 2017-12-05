// Copyright 2017 fatedier, fatedier@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package client

import (
	"encoding/json"
	"net/http"

	"github.com/julienschmidt/httprouter"
	ini "github.com/vaughan0/go-ini"

	_ "fmt"
	"models/config"
	_ "models/msg"
	"utils/log"
)

type GeneralResponse struct {
	Code int64  `json:"code"`
	Msg  string `json:"msg"`
}

// api/reload
type ReloadResp struct {
	GeneralResponse
}

func (svr *Service) apiReload(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	var (
		buf  []byte
		res  ReloadResp
		conf ini.File
		err  error
		resp *http.Response
	)
	defer func() {
		log.Info("Http response [/api/reload]: code [%d]", res.Code)
		buf, _ = json.Marshal(&res)
		w.Write(buf)
	}()

	log.Info("Http request: [/api/reload]")
	if config.ClientCommonCfg.Host == "" {
		conf, err = ini.LoadFile("./frpc.ini")
	} else {
		resp, err = http.Get("http://" + config.ClientCommonCfg.Host + "/api/frpc?user=" + config.ClientCommonCfg.User)
		if err != nil {
			panic(err)
		}
		conf, err = ini.Load(resp.Body)
	}
	if err != nil {
		res.Code = 1
		res.Msg = err.Error()
		log.Error("reload frpc config file error: %v", err)
		return
	}

	newCommonCfg, err := config.LoadClientCommonConf(conf)
	if err != nil {
		res.Code = 2
		res.Msg = err.Error()
		log.Error("reload frpc common section error: %v", err)
		return
	}

	pxyCfgs, vistorCfgs, err := config.LoadProxyConfFromFile(config.ClientCommonCfg.User, conf, newCommonCfg.Start)
	if err != nil {
		res.Code = 3
		res.Msg = err.Error()
		log.Error("reload frpc proxy config error: %v", err)
		return
	}
	svr.ctl.reloadConf(pxyCfgs, vistorCfgs)
	log.Info("success reload conf")
	//svr.Close()
	return
}
